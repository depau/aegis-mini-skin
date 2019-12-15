
function vmult(v1, v2, index=0) =
    index == len(v1) - 1
        ? [v1[index] * v2[index]]
        : concat([v1[index] * v2[index]], vmult(v1, v2, index+1));
