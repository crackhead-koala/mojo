struct Vector3:
    var x: FloatLiteral
    var y: FloatLiteral
    var z: FloatLiteral

    fn __init__(inout self, x: FloatLiteral, y: FloatLiteral, z: FloatLiteral):
        self.x = x
        self.y = y
        self.z = z

    fn __init__(inout self) -> None:
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0

    fn to_string(self) -> String:
        return '(' + String(self.x) + ', ' + String(self.y) + ', ' + String(self.z) + ')'

    # convenience overloads
    fn __add__(self, vec: Vector3) -> Vector3:
        return Vector3(self.x + vec.x, self.y + vec.y, self.z + vec.z)

    fn __add__(self, val: FloatLiteral) -> Vector3:
        return Vector3(self.x + val, self.y + val, self.z + val)

    fn __sub__(self, vec: Vector3) -> Vector3:
        return Vector3(self.x - vec.x, self.y - vec.y, self.z - vec.z)

    fn __sub__(self, val: FloatLiteral) -> Vector3:
        return Vector3(self.x - val, self.y - val, self.z - val)

    fn __mul__(self, v: Vector3) -> FloatLiteral:
        return self.x * v.x + self.y * v.y + self.z * v.z

    fn __iadd__(inout self, rhs: FloatLiteral):
        self.x += rhs
        self.y += rhs
        self.z += rhs

    fn __isub__(inout self, rhs: FloatLiteral):
        self.x -= rhs
        self.y -= rhs
        self.z -= rhs


fn main():
    let v1: Vector3 = Vector3(1.0, 1.0, 0.0)
    print('v1 =', v1.to_string())

    let v2: Vector3 = Vector3(2.0, 9.0, -12.0)
    print('v2 =', v2.to_string())

    print('v1 + v2 =', (v1 + v2).to_string())
    print('v1 + 4.9 =', (v1 + 4.9).to_string())
    print('v1 * v2 =', v1 * v2)

    var v3: Vector3 = Vector3()
    v3 += 2.0
    print('v3 =', v3.to_string())
