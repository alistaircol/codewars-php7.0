<?php

function simple_assembler(array $program): array
{
    // TODO
}

print_r(
    simple_assembler(['mov c 12','mov b 0','mov a 200','dec a','inc b','jnz a -2','dec c','mov a b','jnz c -5','jnz 0 1','mov c a'])
);
