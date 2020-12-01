//This Source file is written by Nikita Rath (18BLC1131)
//FUNCTION FOR LRU
function [] = lru(a,n)
    printf("\tNo. of Frames \t LRU")
    x = 1
    //for frames 1 to 7
    while(x < 8)
        counter = 0
        faults = 0
        //Intialise all frames to -1
        for i = 1:x
            frames(i) = -1
        end
        //Traversing through pages
        for i = 1:n
            flag1 = 0 
            flag2 = 0
            //Traversing through frames
            for j = 1:x
                //Page available in frame 
                if(frames(j) == a(i)) then
                    counter = counter + 1
                    temp(j) = counter
                    //Set flag1 and flag2
                    flag1 = 1
                    flag2 = 1
                    break
                end
            end
            //Page unavailable in frame
            if(flag1 == 0) then
                //Traversing through frames
                for j = 1:x
                    //Frame has empty space
                    if(frames(j) == -1) then
                        counter = counter + 1
                        //Increment page faults
                        faults = faults + 1
                        frames(j) = a(i)
                        temp(j) = counter
                        flag2 = 1
                        break
                    end
                end
            end
            //Page unavailable in frame
            if(flag2 == 0) then
                minimum = temp(1)
                pos = 1
                //Traversing through frames
                for k = 2:x
                    //Find least recently used page
                    if(temp(k) < minimum) then
                        minimum = temp(k)
                        pos = k
                    end
                end
                counter = counter + 1
                //Increment page faults
                faults = faults + 1
                frames(pos) = a(i)
                temp(pos) = counter
            end
        end
        //Total page faults
        printf("\n\t\t %d \t %d ", x, faults)
        x = x + 1
    end
    printf("\n")
endfunction
