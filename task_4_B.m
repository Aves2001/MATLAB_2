try
    clear
    clc
    a = genArrayRand('a');
    clc
    fprintf("�������� �����:\n\n");
    disp(a);
    dob = dob_nonzero_elements(a);
    summ = sum_modules_array(a);
    fprintf("1) ������� ���������� �������� ������ = %d\n", dob);
    fprintf("2) ���� ������ �������� ������, ������������ \n   ���� ������� �䒺����� �������� = %d\n", summ);
catch ex
    disp('�������:');
    disp(ex.message);
end

function summ = sum_modules_array(arr)
    summ=0;
    min=-1;
    size_arr = size(arr);
    size_arr = size_arr(2);
    for i = 1:size_arr
        if arr(i)<0
            if ((1+i) ~= size_arr)
                min=(1+i);
            else
                min=(1+i);
            end
            break
        end
    end
    if min==-1
        return
    end
    for i = min:size_arr
        summ = summ + abs(arr(i));
    end
end

function dob = dob_nonzero_elements(arr)
    dob=1;
    size_arr = size(arr);
    size_arr = size_arr(2);
    for i = 1:size_arr
        if arr(i)~=0
            dob=dob*arr(i);
        end
    end
end

function array = genArrayRand(s)
    err = 1;
    while err
        try
            err=0;
            fprintf('������� ��������� ������ %s:\n', s);
            n = input('ʳ������ �������� = ');
            if isempty(n)
                disp('������� ������� ��������� ������');
                err=1;
            elseif ~isnumeric(n)
                disp('������� ������� �����');
                err=1;
            elseif n < 1
                disp('ʳ������ �������� �� ���� �������� ������');
                err=1;
            elseif (n == floor(n)) == 0
                disp('������� ������ ���� �����');
                err=1;
            end
        catch
            disp("������, ������ �� ���:")
            err=1;
        end
    end
   
    array = randi([-100,100],1,n);
end