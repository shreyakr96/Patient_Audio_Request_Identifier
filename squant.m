function [ y1 ] = squant( y,Fs )
sound(y,Fs); % in this case, y is a normallised output between -1 and 1, and Fs =sampling frequency
k=length(y);
%disp(k);
%disp(Fs);



ctr=0; p=0;
y1=zeros(250,1);

for i=1:16000   % Re-samples audio signal such that only 250 samples are taken for two seconds. As original sampling frequency is 8000, for two seconds, there will be 16000 samples. by dividing by 64 and assigning each 64th sample to a new array, we get only 250 samples.
    ctr=ctr+1;
    if ctr==64
        p=i/64;
        y1(p,1)=y(i,1);
        ctr=0;
    end
end


t1=1:1:length(y1);
plot(t1,y1);
y1=100.*y1;


m=abs(y1);%Taking absolute value to avoid making negative quantisation levels.


for i=1:250  % dividing into 16 quantisation levels using if condition.
    if y1(i,1)>=0 && y1(i,1)<0.5
        y1(i,1)=0;  % quantisation level 0.
        
    elseif y1(i,1)>=0.5 && y1(i,1)<1
        y1(i,1)=1; % quantisation level 1
        
    elseif y1(i,1)>=1 && y1(i,1)<1.5
        y1(i,1)=2;
        
    elseif y1(i,1)>=1.5 && y1(i,1)<2
        y1(i,1)=3;
        
    elseif y1(i,1)>=2 && y1(i,1)<2.5
        y1(i,1)=4;
        
    elseif y1(i,1)>=2.5 && y1(i,1)<3
        y1(i,1)=5;
        
    elseif y1(i,1)>=3 && y1(i,1)<3.5
        y1(i,1)=6;
        
    elseif y1(i,1)>=3.5 && y1(i,1)<4
        y1(i,1)=7;
        
    elseif y1(i,1)>=4 && y1(i,1)<4.5
        y1(i,1)=8;
        
    elseif y1(i,1)>=4.5 && y1(i,1)<5
        y1(i,1)=9;
        
    elseif y1(i,1)>=5 && y1(i,1)<5.5
        y1(i,1)=10;
        
    elseif y1(i,1)>=5.5 && y1(i,1)<6
        y1(i,1)=11;
        
    elseif y1(i,1)>=6 && y1(i,1)<6.5
        y1(i,1)=12;
        
    elseif y1(i,1)>=6.5 && y1(i,1)<7
        y1(i,1)=13;
        
    elseif y1(i,1)>=7 && y1(i,1)<7.5
        y1(i,1)=14;
        
        
        
    else
        y1(i,1)=15;
    end
end

end



