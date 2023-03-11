format rat

A=[1 1;0 1;1 0];
B=[2 1 -2];
C=[2 2 2 2; 17/10 1/10 -17/10 -1/10; 3/5 9/5 -3/5 -9/5]

[U3, S3, V3] = svd(A, "econ");
[U_3, S_3, V_3] = svd(A);

U_3*S_3*V_3'
U3*S3*V3'

[U2, S2, V2] = svd(B, "econ");
[U_2, S_2, V_2] = svd(B);

U_2*S_2*V_2'
U2*S2*V2'

[U1, S1, V1] = svd(C, "econ");
[U, S, V] = svd(C);

U*S*V'
U1*S1*V1'