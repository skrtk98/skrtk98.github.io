## 可算性

可算性公理は, 空間の局所情報を可算個の開集合で記録できるかを表す.
第一可算性は点ごとの近傍基, 第二可算性は空間全体の開基の可算性を表す.

### 可算公理

Definition. **可分空間**
:   位相空間 $`X`$ が **可分** (*separable*) であるとは, $`X`$ の位相的密度が高々可算であるときいう.
    可分な位相空間を **可分空間** (*separable space*) という.

Definition. **第一可算空間**
:   位相空間 $`X`$ が **第一可算** (*first-countable*) であるとは, $`X`$ の位相的指標が高々可算であるときいう.
    第一可算な位相空間を **第一可算空間** (*first-countable space*) という.
    第一可算であるための条件を **第一可算公理** (*first axiom of countability*) という.

Definition. **第二可算空間**
:   位相空間 $`X`$ が **第二可算** (*second-countable*) であるとは, $`X`$ の位相的荷重が高々可算であるときいう.
    第二可算な位相空間を **第二可算空間** (*second-countable space*) という.
    第二可算であるための条件を **第二可算公理** (*second axiom of countability*) という.

Proposition.
:   第二可算空間は可分である.

<u>proof.</u>
:   $`X`$ の可算な開基を $`\mathcal{B}`$ とする.
    空集合でない各 $`B\in\mathcal{B}`$ から一点 $`x_B\in B`$ を選び, これらの点全体を $`D`$ とする.
    $`\mathcal{B}`$ は可算であるから $`D`$ も可算である.
    空でない開集合 $`U\subseteq X`$ をとると, 開基の性質により $`B\in\mathcal{B}`$ で $`\emptyset\neq B\subseteq U`$ を満たすものが存在する.
    このとき $`x_B\in D\cap U`$ である.
    よって $`D`$ は稠密であり, $`X`$ は可分である.