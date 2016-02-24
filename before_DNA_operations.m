function [R5] = before_DNA_operations(prbg, R5)

M = 512;
N = 512;
ptr = 1;% use to scan 'prbg'

for i = 1:N
    str = '';
    for t = ptr:ptr+2
        str = [str, dec2bin(prbg(t))];
    end;
    RULE2 = bin2dec(str);%state in PAPER
    
    str2 = '';
    C_R5 = '';
    for t = ptr+3:ptr+5
        str2 = [str2, dec2bin(prbg(t))];
    end;
    RULE = bin2dec(str2);%state in PAPER
    
    
    switch RULE
        case 0
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'A'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'G'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'C'];
                else
                    temp_CR5 = [temp_CR5, 'T'];
                end;
            end;

            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 1
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'A'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'C'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'G'];
                else
                    temp_CR5 = [temp_CR5, 'T'];
                end;
            end;

            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 2
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'T'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'G'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'C'];
                else
                    temp_CR5 = [temp_CR5, 'A'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 3
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'T'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'C'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'G'];
                else
                    temp_CR5 = [temp_CR5, 'A'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 4
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'C'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'T'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'A'];
                else
                    temp_CR5 = [temp_CR5, 'G'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 5
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'C'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'A'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'T'];
                else
                    temp_CR5 = [temp_CR5, 'G'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 6
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'G'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'T'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'A'];
                else
                    temp_CR5 = [temp_CR5, 'C'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
            
        case 7
            temp = R5(i, :);
            temp_CR5 = '';
            for j = 1:2:N-1
                if temp(j) == 0 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'G'];
                elseif temp(j) == 0 && temp(j+1) == 1
                    temp_CR5 = [temp_CR5, 'A'];
                elseif temp(j) == 1 && temp(j+1) == 0
                    temp_CR5 = [temp_CR5, 'T'];
                else
                    temp_CR5 = [temp_CR5, 'C'];
                end;
            end;
            
            switch RULE2
                case 0
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 1
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 2
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '10'];
                        else
                            C_R5 = [C_R5, '01'];
                        end;
                    end;
                case 3
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '11'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '00'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '01'];
                        else
                            C_R5 = [C_R5, '10'];
                        end;
                    end;
                case 4
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 5
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '00'];
                        else
                            C_R5 = [C_R5, '11'];
                        end;
                    end;
                case 6
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
                case 7
                    for k = 1:N/2
                        if char(temp_CR5(k)) == 'A'
                            C_R5 = [C_R5, '01'];
                        elseif char(temp_CR5(k)) == 'T'
                            C_R5 = [C_R5, '10'];
                        elseif char(temp_CR5(k)) == 'C'
                            C_R5 = [C_R5, '11'];
                        else
                            C_R5 = [C_R5, '00'];
                        end;
                    end;
            end;
            ptr = ptr + 6;
            C_R5_M(i, :) = C_R5;
    end;
    
end;

R5 = C_R5_M;
