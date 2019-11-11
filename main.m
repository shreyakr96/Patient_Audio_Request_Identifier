clc;

[y,Fs] = audioread('hungry1.wav'); % Takes the hungry sound file as input ( a 2 sec .wav file)
output1 = squant( y,Fs );          % takes 250 samples in a period of 2 sec, and quantises the values into 16 levels using the squant function.
disp("Hungry vector");
disp(output1);                     %displays the quantised 250 values corresponding to that .wav file
pause(3);


[y,Fs] = audioread('pain1.wav'); % Similar as above for pain sound file
output2 = squant( y,Fs );
disp("Pain vector");
disp(output2);
pause(3);


[y,Fs] = audioread('help2.wav'); % Same steps for help sound file
output3 = squant( y,Fs );
disp("Help vector");
disp(output3);
pause(5);


%Taking in the new word
recObj7 = audiorecorder
disp('Say either hungry/pain/help') %allows user to feed new word
recordblocking(recObj7, 2);
disp('End of Recording.');
y = getaudiodata(recObj7);
filename = 'testcase.wav';         % Store the word in a .wav file
audiowrite(filename,y ,8000);
[y,Fs] = audioread('testcase.wav'); % sanple and quantise this audio signal just as the above cases
output4 = squant( y,Fs );
disp("Testcase vector");
disp(output4);




sum1=0; sum2=0; sum3=0;sum4=0;

for i=1:250
    sum1=sum1+output1(i,1);  % Calculate the sum of each quantised and sampled dataset.
    sum2=sum2+output2(i,1);
    sum3=sum3+output3(i,1);
    sum4=sum4+output4(i,1);
end

disp('sum1');
disp(sum1);
disp('sum2');
disp(sum2);
disp('sum3');
disp(sum3);
disp('sum4');
disp(sum4);
check1=sum4-sum1; %Find the difference in the sum of the new word and each previous word ie hunger, pain and help
check1=abs(check1);
check2=sum4-sum2;
check2=abs(check2);
check3=sum4-sum3;
check3=abs(check3);
if check1>check2  % Find the word with the minimum difference from the test word and display that word.
    if check2>check3
        disp("HELP is the word spoken");
    else
        disp("PAIN is the word spoken");
    end
    
else
    if check1>check3
        disp("HELP is the word spoken");
    else
        disp("HUNGRY is the word spoken");
    end
end






