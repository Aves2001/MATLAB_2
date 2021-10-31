try
    clear
    clc
    a = genArray('a');
    size_a = size(a);
    size_a = size_a(2);
    
    b = zeros(0,size_a);
    
    j=1;
    for i = 1:size_a
        if a(i)>0
            b(j) = a(i);
            j=j+1;
        end
    end
    clc
    a
    if j ~= 1
        b = sort(b)
    else
        fprintf("b = \n\n\tДодатних чисел немає\n\n");
    end
    
catch ex
    disp('Помилка:');
    disp(ex.message);
end


function array = genArray(s)
    err = 1;
    while err
        try
            err=0;
            fprintf('\nЗадайте розмірність масива %s:\n', s);
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