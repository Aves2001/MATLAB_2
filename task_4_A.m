try
    clear
    clc
    a = genArray('a');
    clc
    fprintf("Введений масив:\n\n");
    disp(a);
    dob = dob_nonzero_elements(a);
    summ = sum_modules_array(a);
    fprintf("1) Добуток ненульових елементів масиву = %d\n", dob);
    fprintf("2) Сума модулів елементів масиву, розташованих \n   після першого від’ємного елемента = %d\n", summ);
catch ex
    disp('Помилка:');
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
    flag = true;
    size_arr = size(arr);
    size_arr = size_arr(2);
    for i = 1:size_arr
        if arr(i)~=0
            dob=dob*arr(i);
            flag=false;
        end
    end

    if flag
        dob=0;
    end
end

function array = genArray(s)
    err = 1;
    while err
        try
            err=0;
            fprintf('Задайте розмірність масива %s:\n', s);
            n = input('Кількість елементів = ');
            if isempty(n)
                disp('Потрібно вказати розмірність масива');
                err=1;
            elseif ~isnumeric(n)
                disp('Потрібно вказати число');
                err=1;
            elseif n < 1
                disp('Кількість елементів має бути додатним числом');
                err=1;
            elseif (n == floor(n)) == 0
                disp('Потрібно ввести ціле число');
                err=1;
            end
        catch
            disp("Помлка, введіть ще раз:")
            err=1;
        end
    end
   
    fprintf('Задайте значення елементів масива %s:\n', s);
    array = zeros(0,n);
    for i = 1 : n
        ok_input = 1;
        while ok_input
            try
                array(i) = input(sprintf('%s[%d] = ', s, i));
                if isempty(array(i))
                    ok_input = 1;
                    disp('Потрібно ввести значення');
                elseif ~isnumeric(array(i))
                    ok_input = 1;
                    disp('Потрібно вказати число');
                else
                    ok_input = 0;
                end
            catch
                ok_input = 1;
            end
        end
    end
end