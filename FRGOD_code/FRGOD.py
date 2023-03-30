# Detecting Fuzzy Rough Granules-based Outlier Detection (FRGOD) algorithm
# Please refer to the following papers:
# Yuan Zhong, Chen Hongmei, Li Tianrui, Sang Binbin, Shu Wang.
# Outlier Detection based on fuzzy rough granules in mixed attribute data,
# IEEE Transactions on Cybernetics,2022.
# Uploaded by Yuan Zhong on Mar. 30, 2023. E-mail:yuanzhong2799@foxmail.com.
import numpy as np
from scipy.io import loadmat
from scipy.spatial.distance import cdist
from sklearn.preprocessing import MinMaxScaler

# input:
# data is data matrix without decisions, where rows for samples and columns for attributes.
# lammda is used to adjust the adaptive fuzzy radius.
# Numeric attributes are normalized to [0,1].
# output:
# Fuzzy rough granules-based outlier factor (FRGOF)

def FRGOD(data, lammda):
    n, m = data.shape

    delta = np.zeros(m)
    ID = (data <= 1).all(axis=0)
    delta[ID] = (np.std(data[:, ID], axis=0)) / lammda

    NbrSet = np.zeros((n, n, m))
    for col in range(m):
        temp = cdist(data[:, col].reshape(-1, 1), data[:, col].reshape(-1, 1), metric='cityblock')
        temp[temp > delta[col]] = 1
        r = 1 - temp
        NbrSet[:, :, col] = r
        
    LA = np.arange(0, m)
    weight1 = np.zeros((n, m))
    weight3 = np.zeros((n, m))
    Acc_A_a = np.zeros((n, m, m))
    for col in range(0, m):
        lA_d = np.setdiff1d(LA, col)
        Acc_A_a_tem = np.zeros((n, m))
        NbrSet_tem = NbrSet[:, :, col]
        NbrSet_temp, ia, ic = np.unique(NbrSet_tem, return_index=True, return_inverse=True, axis=0)
        for i in range(0, NbrSet_temp.shape[0]):
            RM_temp = np.tile(NbrSet_temp[i, :], (n, 1))
            i_tem = np.where(ic == i)[0]
            for k in range(-1, m - 1):
                if (k == -1):
                    lA_de = lA_d
                else:
                    lA_de = np.setdiff1d(lA_d, lA_d[k])
                NbrSet_tmp = np.min(NbrSet[:, :, lA_de], axis=2)
                Low_A = sum((np.maximum(1 - NbrSet_tmp, RM_temp)).min(-1))
                Upp_A = sum((np.minimum(NbrSet_tmp, RM_temp)).max(-1))
                Acc_A_a_tem[i_tem, k + 1] = Low_A / Upp_A
            Acc_A_a[:, :, col] = Acc_A_a_tem
            weight3[i_tem, col] = 1 - (sum(NbrSet_temp[i, :]) / n) ** (1 / 3)
            weight1[i_tem, col] = (sum(NbrSet_temp[i, :]) / n)
            
    FSDOG = np.zeros((n, m))
    for col in range(m):
        Acc_A_a_tem = Acc_A_a[:, :, col]
        FSDOG[:, col] = 1 - ((np.sum((Acc_A_a_tem[:, 1:m] + 1) / 2, axis=1) + Acc_A_a_tem[:, 0]) / m) * weight1[:, col]

    FRGOF = np.mean(FSDOG * weight3, axis=1)
    return FRGOF

if __name__ == "__main__":
    load_data = loadmat('Example.mat')
    trandata = load_data['Example']
    scaler = MinMaxScaler()
    trandata[:, 1:3] = scaler.fit_transform(trandata[:, 1:3])

    lam = 1
    out_factor = FRGOD(trandata, lam)
    print(out_factor)
