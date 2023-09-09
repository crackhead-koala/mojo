from python import Python
from python.object import PythonObject


struct Complex:
    var re: FloatLiteral
    var im: FloatLiteral

    fn __init__(inout self, re: FloatLiteral, im: FloatLiteral):
        self.re = re
        self.im = im

    fn __copyinit__(inout self, other: Complex):
        self.re = other.re
        self.im = other.im

fn print(x: Complex):
    print_no_newline(x.re)
    print_no_newline(' + i')
    print_no_newline(x.im)
    put_new_line()


fn native_sqrt(x: FloatLiteral) raises -> PythonObject:
    let math = Python.import_module('math')
    return math.sqrt(x)


fn custom_sqrt(x: FloatLiteral, iters: Int) -> FloatLiteral:
    var r: FloatLiteral = x
    for _ in range(iters):
        r = (r + x / r) / 2
    return r


fn negative_custom_sqrt(x: FloatLiteral, iters: Int) -> Complex:
    return Complex(0.0, custom_sqrt(-x, iters))


fn main() raises:
    print(native_sqrt(22.0))
    print(custom_sqrt(22.0, 10))
    print(custom_sqrt(22.0, 20))
    print(custom_sqrt(22.0, 40))
    print(negative_custom_sqrt(-22.0, 10))
