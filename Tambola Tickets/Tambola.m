clc;
clear;
close all;

pattern=zeros(3,9);%binarystructure

%ensurenoemptycolumn
for c=1:9
    r=randi(3);%randomrow
    pattern(r,c)=1;
end

%ensureeachrowhasexactly5ones
for r=1:3
    while sum(pattern(r,:))<5
        c=randi(9);
        if pattern(r,c)==0
            if sum(pattern(:,c))<3%max3entriespercolumn
                pattern(r,c)=1;
            end
        end
    end
end

disp('Binary Tambola Ticket');
disp(pattern);

ticket=zeros(3,9);%finalticket

for col=1:9

    %columnranges
    if col==1
        startv=1;endv=9;
    elseif col==9
        startv=80;endv=90;
    else
        startv=(col-1)*10;
        endv=startv+9;
    end

    %countnumbersincolumn
    cnt=sum(pattern(:,col));

    %generateuniquenumbers
    nums=startv:endv;
    nums=nums(randperm(length(nums)));
    nums=nums(1:cnt);

    %manualascendingorder
    for a=1:cnt
        for b=1:cnt-a
            if nums(b)>nums(b+1)
                temp=nums(b);
                nums(b)=nums(b+1);
                nums(b+1)=temp;
            end
        end
    end

    %assigntopbottom
    k=1;
    for r=1:3
        if pattern(r,col)==1
            ticket(r,col)=nums(k);
            k=k+1;
        end
    end
end

disp('The Tambola Ticket:');
disp(ticket);