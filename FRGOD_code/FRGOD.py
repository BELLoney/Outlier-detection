from scipy.io import loadmat
from sklearn.preprocessing import MinMaxScaler
import numpy as np
# Detecting Fuzzy Rough Granules-based Outlier Detection (FRGOD) algorithm
# Please refer to the following papers:
# Yuan Zhong, Chen Hongmei, Li Tianrui, Sang Binbin, ShuWang.
# Outlier Detection based on fuxxy rough granules in mixed attribute data,
# IEEE Transactions on Cybernetics,2021.
# Uploaded by Yuan Zhong on Oct. 12, 2021. E-mail:yuanzhong2799@foxmail.com.
def FRGOD(data, lammda):
# input:data is data matrix without decisions, where rows for samples and columns for attributes.
# lammda is used to adjust the adaptive fuzzy radius.
# output:Ranking objects and fuzzy rough granules-based outlier factor (FRGOF).
    data = np.array(data)
    n, m = data.shape
    LA = list(range(0, m))
    weight1 = np.zeros((n, m))
    weight3 = np.zeros((n, m))
    delta = [0] * m
    for i in range(0, m):
        a = data[:, i]
        if  all(x <= 1 for x in a):
            delta[i] = np.round(np.std(a) / lammda, 4)
    for k in range(0, m):
        col = k
        x = data[:, col]
        r = np.zeros((n, n))
        name = 'NbrSet' + str(k)
        locals()['NbrSet' + str(k)] = np.zeros((n, n))
        for i in range(0, n):
            x = data[:, col]
            for j in range(0, n):
                r[i, j] = np.round(kersim(x[i], x[j], delta[k]), 4)
                r[j, i] = r[j, i]
        locals()['NbrSet' + str(k)] = r
    # 计算粒精度
    for l in range(0, m):
        LA_d = np.setdiff1d(LA, l)
        name = 'Acc_A_a' + str(l)
        locals()['Acc_A_a' + str(l)] = np.zeros((n, m))
        NbrSet_tem = locals()['NbrSet' + str(l)]
        # 计算粒精度
        for k in range(0, m):
            if k == 0:
                LA_de = LA_d
            else:
                LA_de = np.setdiff1d(LA_d, LA_d[k - 1])
            LA_de_l = len(LA_de)
            Low_A = []
            Upp_A = []
            # 剩余属性的交集
            NbrSet_tmp = locals()['NbrSet' + str(LA_de[0])]
            for i in range(1, LA_de_l):
                NbrSet_tmpAtemp = locals()['NbrSet' + str(LA_de[i])]
                NbrSet_tmp = np.minimum(NbrSet_tmp, NbrSet_tmpAtemp)
            # print(str(l), LA_de, 'k=', str(k))
            # print(NbrSet_tmp)
            b = NbrSet_tmp
            c = np.ones((n, n)) - NbrSet_tmp
            for i in range(0, n):
                weight1[i, l] = np.round(np.sum(NbrSet_tem[i, :]) / n, 4)  # list n行m列
                weight3[i, l] = 1 - np.round((np.sum(NbrSet_tem[i, :]) / n) ** (1 / 3), 4)
                a = np.tile(NbrSet_tem[i, :], (n, 1))
                Low_A = np.sum(np.maximum(a, c).min(-1))
                Upp_A = np.sum(np.minimum(a, b).max(-1))
                tem = np.round(Low_A / Upp_A, 4)
                locals()['Acc_A_a' + str(l)][i, k] = tem
    # 计算异常程度
    FSDOG = np.zeros((n, m))
    for i in range(0, n):
        for k in range(0, m):
            Acc_A_a = locals()['Acc_A_a' + str(k)]
            FSDOG[i, k] = 1 - np.round(
                ((np.sum(((Acc_A_a[i, 1:m]) + np.ones((1, m - 1))) / 2) + Acc_A_a[i, 0]) / m) * weight1[i, k], 4)

    # 对象异常程度
    FRGOF = np.zeros(n)
    M_W_GOD = np.multiply(FSDOG, weight3)
    for i in range(0, n):
        FRGOF[i] = np.sum(M_W_GOD[i, :]) / m
    return FRGOF

def kersim(a, x, e):
    if e == 0:
        if (a == x):
            kersim = 1
        else:
            kersim = 0
    else:
        if abs(a - x) > e:
            kersim = 0
        else:
            kersim = 1 - abs(a - x)
    return kersim

if __name__ == "__main__":
    load_data = loadmat('Example.mat')
    trandata = load_data['Example']
    scaler = MinMaxScaler()
    trandata[:, 1:3] = scaler.fit_transform(trandata[:, 1:3])

    lam = 1
    out_factor = FRGOD(trandata, lam)
    print(out_factor)

