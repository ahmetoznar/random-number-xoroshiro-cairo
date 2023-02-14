%lang starknet
from src.randomgenerator.xoroshiro128_starstar import next
from starkware.cairo.common.bitwise import bitwise_and, bitwise_or, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.common.math import assert_le, split_felt, unsigned_div_rem
from starkware.cairo.common.registers import get_label_location


@external
func test_randomnumber{syscall_ptr: felt*, bitwise_ptr: BitwiseBuiltin*, pedersen_ptr: HashBuiltin*, range_check_ptr}(){
    let (res) = get_next_rnd(161803398);
    %{print(ids.res, "random number here")%}
    return ();
}

func get_next_rnd{syscall_ptr: felt*, bitwise_ptr: BitwiseBuiltin*, pedersen_ptr: HashBuiltin*, range_check_ptr}(seed : felt) -> (rnd : felt){
    let (rnd) = next(seed);
    return (rnd,);
}

