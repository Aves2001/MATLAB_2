try
    clear
    clc
    A = genArray('A');
    B = genArray('B');
    clc
    disp('------------------------------------------------------------------------------');
    disp('Вхідні дані:');
    A
    B
    %A = [4 4; 6 3]
    %B = [1 -2; 3 -3]
    C = [-3 -2 3; 0 1 -2]
    F = [0 0; 0 3; -1 -4]
    G = [3 -4 3; 1 -1 -1]
    H = [0 2 2; 0 1 -1; -2 4 1]

    f1 = -4*A;
    f2 = A+B;
    f3 = f1+(3*B);
    f4 = G';
    f5 = F+f4;
    f6 = A*B;
    f7 = B*A;
    f8 = C*F;
    f9 = G*H;
    
    disp('------------------------------------------------------------------------------');
    disp('Результати обчислень:')
    fprintf('-4*A = \n\n');
    disp(f1);
    fprintf('A+B = \n\n');
    disp(f2);
    fprintf('(-4*A)+(3*B) = \n\n');
    disp(f3);
    fprintf("G' = \n\n");
    disp(f4);
    fprintf("F+G' = \n\n");
    disp(f5);
    fprintf('A*B = \n\n');
    disp(f6);
    fprintf('B*A = \n\n');
    disp(f7);
    fprintf('C*F = \n\n');
    disp(f8);
    fprintf('G*H = \n\n');
    disp(f9);
catch ex
    disp('Помилка:');
    disp(ex.message);
end


function array = genArray(s)
ok = 1;
    while ok
        try
            fprintf('\nЗадайте розмірність масива %s:\n', s);
            n = input('Кількість рядків, та стовпців = ');
            
            if isempty(n)
                error('Потрібно вказати розмірність масива');
            elseif ~isnumeric(n)
                error('Потрібно вказати число');
            elseif n < 1
                error('Розмірність має бути додатним числом');
            end

            fprintf('Задайте значення елементів масива %s:\n', s);
            array = zeros(n);
            for i = 1 : n
                for j = 1 : n
                    ok_input = 1;
                    while ok_input
                        try
                            array(i,j) = input(sprintf('%s[%d][%d] = ', s, i,j));
                            if isempty(array(i,j))
                                ok_input = 1;
                                disp('Потрібно ввести значення');
                            elseif ~isnumeric(array(i,j))
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
            clc
            disp('Перевірте правильність введення:');
            fprintf('%s = \n\n',s);
            disp(array);
            choice = menu('Зберегти?', 'Так','Ні');
            if choice == 1
                ok = 0;
            else
                ok = 1;
            end
        catch ex
            ok = 1;
            clc
            disp('Помилка:');
            disp(ex.message);
        end
    end
end