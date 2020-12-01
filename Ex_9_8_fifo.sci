//This Source file is written by Nikita Rath (18BLC1131)
//FUNCTION FOR FIFO
function [] = fifo(a,n)
    printf("\tNo. of Frames \t FIFO")
    x = 1
    //for frames 1 to 7
    while(x < 8)
        counter = 0
        faults = 0
        //Intialise all frames to -1
        for i = 1:x
            frames(i) = -1
        end
        flag1 = 1
        //Traversing through pages
        for i = 1:n
            counter = 0
            //Traversing through frames
            for k = 1:x
                //Page available in frame
                if(frames(k) == a(i)) then
                    counter = counter + 1
                end
            end
            //Page unavailable in frame
            if(counter == 0) then
                //First in page gets replaced first in frame
                frames(flag1+1) = a(i)
                flag1 = modulo((flag1+1),x)
                //Increment page faults
                faults = faults + 1
            end
        end
        //Total page faults
        printf("\n\t\t %d \t %d ", x, faults)
        x = x + 1
    end
    printf("\n")
endfunction
