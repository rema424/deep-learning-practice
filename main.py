# %%
import numpy as np
import matplotlib.pyplot as plt

# from matplotlib.image import imread

# データの生成
x = np.arange(0, 6, 0.1)
y1 = np.sin(x)
y2 = np.cos(x)

# plt.p


# グラフの描画
plt.plot(x, y1, label="sin")
plt.plot(x, y2, label="cos", linestyle="--")
plt.xlabel("x")
plt.ylabel("y")
plt.title("sin & cos")
plt.legend()

# 画像の読み込み
# img = imread('./../dataset/lena.png')
# img = imread('./lena.png')
# plt.imshow(img)

plt.show()
