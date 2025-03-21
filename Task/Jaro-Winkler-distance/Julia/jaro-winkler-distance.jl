const words = read("linuxwords.txt", String) |> split .|> strip

function jarowinklerdistance(s1, s2)
    if length(s1) < length(s2)
        s1, s2 = s2, s1
    end
    len1, len2 = length(s1), length(s2)
    len2 == 0 && return 0.0
    delta = max(0, len1 ÷ 2 - 1)
    flag = zeros(Bool, len2)  # flags for possible transpositions, begin as false
    ch1_match = eltype(s1)[]
    for (i, ch1) in enumerate(s1)
        for (j, ch2) in enumerate(s2)
            if (j <= i + delta) && (j >= i - delta) && (ch1 == ch2) && !flag[j]
                flag[j] = true
                push!(ch1_match, ch1)
                break
            end
        end
    end
    matches = length(ch1_match)
    matches == 0 && return 1.0
    transpositions, i = 0, 0
    for (j, ch2) in enumerate(s2)
        if flag[j]
            i += 1
            transpositions += (ch2 != ch1_match[i])
        end
    end
    jaro = (matches / len1 + matches / len2 + (matches - transpositions/2) / matches) / 3.0
    commonprefix = count(i -> s1[i] == s2[i], 1:min(len2, 4))
    return 1 - (jaro + commonprefix * 0.1 * (1 - jaro))
end

function closewords(s, maxdistance, maxtoreturn)
    jw = 0.0
    arr = [(w, jw) for w in words if (jw = jarowinklerdistance(s, w)) <= maxdistance]
    sort!(arr, lt=(x, y) -> x[2] < y[2])
    return length(arr) <= maxtoreturn ? arr : arr[1:maxtoreturn]
end

for s in ["accomodate", "definately", "goverment", "occured", "publically",
    "recieve", "seperate", "untill", "wich"]
    println("\nClose dictionary words ( distance < 0.15 using Jaro-Winkler distance) to '$s' are:")
    println("    Word      |  Distance")
    for (w, jw) in closewords(s, 0.15, 5)
        println(rpad(w, 14), "| ", Float16(jw))
    end
end
