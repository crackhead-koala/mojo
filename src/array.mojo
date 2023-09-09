import memory
from memory.unsafe import Pointer


struct Array[T: AnyType, size: Int]:
    var data: Pointer[T]

    fn __init__(inout self):
        self.data = Pointer[T].alloc(size)
        memory.memset_zero(self.data, size)

    fn __len__(self) -> Int:
        return size

    fn __getitem__(self, idx: Int) raises -> T:
        if idx >= size:
            raise Error('Array source index out of range.')
        return self.data.load(idx)

    fn __setitem__(inout self, idx: Int, val: T) raises:
        if idx >= size:
            raise Error('Array destination index out of range.')
        self.data.store(idx, val)


fn print_array[size: Int](x: Array[StringLiteral, size]) raises:
    print_no_newline('<')
    for idx in range(x.__len__()):
        print_no_newline("'")
        print_no_newline(x[idx])
        print_no_newline("'")

        if idx < x.__len__() - 1:
            print_no_newline(', ')

    print_no_newline('> (len: ')
    print_no_newline(x.__len__())
    print_no_newline(')')
    put_new_line()


fn main() raises:
    # Int array
    # var int_arr = Array[Int, 9]()
    # print_array(int_arr, True)

    # int_arr[0] = 12
    # int_arr[1] = 22
    # int_arr[2] = 32
    # int_arr[3] = 42
    # int_arr[4] = 52
    # int_arr[5] = 62
    # int_arr[6] = 72
    # int_arr[7] = 82
    # int_arr[8] = 92

    # print_array(int_arr, True)

    # String array
    var str_arr = Array[StringLiteral, 9]()
    print_array(str_arr)

    str_arr[0] = '12'
    str_arr[1] = '22'
    str_arr[2] = '32'
    str_arr[3] = '42'
    str_arr[4] = '52'
    str_arr[5] = '62'
    str_arr[6] = '72'
    str_arr[7] = '82'
    str_arr[8] = '92'

    print_array(str_arr)
