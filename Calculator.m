clc;
clear;

disp('4-BIT BINARY CALCULATOR USING LOGIC GATES');
disp('------------------------------------------');

% Input A
A = input('Enter 4-bit binary number A (e.g. [0 1 0 1]): ');
A = A(:)';
while length(A) ~= 4 || ~all(A == 0 | A == 1)
    disp('Invalid! Enter exactly 4 bits (0s and 1s only).');
    A = input('Enter 4-bit binary number A: ');
    A = A(:)';
end

% Input B
B = input('Enter 4-bit binary number B (e.g. [0 0 1 1]): ');
B = B(:)';
while length(B) ~= 4 || ~all(B == 0 | B == 1)
    disp('Invalid! Enter exactly 4 bits (0s and 1s only).');
    B = input('Enter 4-bit binary number B: ');
    B = B(:)';
end

% Mode
mode = input('Enter Mode (0 = Addition, 1 = Subtraction): ');
while mode ~= 0 && mode ~= 1
    disp('Invalid! Enter 0 for Addition or 1 for Subtraction.');
    mode = input('Enter Mode (0 = Addition, 1 = Subtraction): ');
end

% XOR gates: conditional inversion of B
B_mod = xor(B, mode);

% Ripple Carry Adder
carry = mode;
S     = zeros(1, 4);
C3    = 0;

for i = 4:-1:1
    S(i)      = xor(xor(A(i), B_mod(i)), carry);
    carry_out = (A(i) & B_mod(i)) | (carry & xor(A(i), B_mod(i)));
    if i == 2
        C3 = carry_out;
    end
    carry = carry_out;
end

C4       = carry;
overflow = xor(C3, C4);

% Decimal conversions
uA = bi2de(fliplr(A));
uB = bi2de(fliplr(B));
uR = bi2de(fliplr(S));

sA = uA; if A(1) == 1, sA = uA - 16; end
sB = uB; if B(1) == 1, sB = uB - 16; end
sR = uR; if S(1) == 1, sR = uR - 16; end

if mode == 0
    trueAnswer = sA + sB;
    op = '+';
else
    trueAnswer = sA - sB;
    op = '-';
end

% Display Results
disp(' ');
disp('==========================================');
disp('RESULTS');
disp('==========================================');
fprintf('Result bits : [%d %d %d %d]\n', S(1), S(2), S(3), S(4));
fprintf('Carry Out   : %d\n', C4);
fprintf('Overflow    : %d\n', overflow);

disp(' ');
disp('-- Unsigned (0 to 15) --------------------');
fprintf('A      = %d\n', uA);
fprintf('B      = %d\n', uB);
fprintf('Result = %d\n', uR);
if mode == 1 && C4 == 0
    fprintf('%d %s %d = %d  (wraps mod 16, borrow occurred)\n', uA, op, uB, uR);
else
    fprintf('%d %s %d = %d\n', uA, op, uB, uR);
end

disp(' ');
disp('-- Signed 2s Complement (-8 to +7) -------');

if A(1) == 1
    fprintf('A      = %d - 16 = %d\n', uA, sA);
else
    fprintf('A      = %d\n', sA);
end

if B(1) == 1
    fprintf('B      = %d - 16 = %d\n', uB, sB);
else
    fprintf('B      = %d\n', sB);
end

if S(1) == 1
    fprintf('Result = %d - 16 = %d\n', uR, sR);
else
    fprintf('Result = %d\n', sR);
end

if overflow
    fprintf('True answer  : %d %s %d = %d\n', sA, op, sB, trueAnswer);
    fprintf('Circuit got  : %d  (wrapped due to overflow)\n', sR);
    fprintf('WARNING: %d is outside [-8, +7], result wraps to %d\n', trueAnswer, sR);
else
    fprintf('%d %s %d = %d  (correct)\n', sA, op, sB, sR);
end

disp('==========================================');