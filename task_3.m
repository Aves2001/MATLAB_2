try
    clear
    clc
    a = genArray('a');
    size_a = size(a);
    size_a = size_a(2);
    
    b = zeros(0,size_a);
    
    j=1;
    for i = 1:size_a
        if a(i)>=0
            b(j) = a(i);
            j=j+1;
        end
    end
    clc
    a
    if j ~= 1
        b = sort(b)
    else
        fprintf("b = \n\n\t�������� ����� ����\n\n");
    end
    
catch ex
    disp('�������:');
    disp(ex.message);
end


function array = genArray(s)
    err = 1;
    while err
        try
            err=0;
            fprintf('\n������� ��������� ������ %s:\n', s);
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
   
    fprintf('������� �������� �������� ������ %s:\n', s);
    array = zeros(0,n);
    for i = 1 : n
        ok_input = 1;
        while ok_input
            try
                array(i) = input(sprintf('%s[%d] = ', s, i));
                if isempty(array(i))
                    ok_input = 1;
                    disp('������� ������ ��������');
                elseif ~isnumeric(array(i))
                    ok_input = 1;
                    disp('������� ������� �����');
                else
                    ok_input = 0;
                end
            catch
                ok_input = 1;
            end
        end
    end
end