import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# إنشاء بيانات المدارات
planets = {
    "Mercury": {"a": 0.39, "e": 0.206, "color": "gray"},
    "Venus": {"a": 0.72, "e": 0.007, "color": "orange"},
    "Earth": {"a": 1.0, "e": 0.017, "color": "blue"},
    "Mars": {"a": 1.52, "e": 0.093, "color": "red"},
}

fig, ax = plt.subplots()
ax.set_xlim(-2, 2)
ax.set_ylim(-2, 2)

def update(frame):
    ax.clear()
    ax.set_xlim(-2, 2)
    ax.set_ylim(-2, 2)
    for planet, params in planets.items():
        a, e, color = params["a"], params["e"], params["color"]
        theta = np.linspace(0, 2 * np.pi, 100)
        r = (a * (1 - e**2)) / (1 + e * np.cos(theta))
        x = r * np.cos(theta + frame * 0.02)
        y = r * np.sin(theta + frame * 0.02)
        ax.plot(x, y, color=color, label=planet)
        ax.scatter(x[frame % 100], y[frame % 100], color=color)
    ax.legend()
    ax.set_aspect('equal')

ani = FuncAnimation(fig, update, frames=200, interval=50)
ani.save("planet_orbits.mp4", writer="ffmpeg")
plt.show()