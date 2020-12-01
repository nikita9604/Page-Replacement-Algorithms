//This Source file is written by Nikita Rath (18BLC1131)
//FUNCTION FOR OPTIMAL
function [] = op(a,n)
    printf("\tNo. of Frames \t Optimal")
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
                        //Increment page faults
                        faults = faults + 1
                        frames(j) = a(i)
                        flag2 = 1
                        break
                    end
                end
            end
            //Page unavailable in frame
            if(flag2 == 0) then
                flag3 =0
                //Traversing through frames
                for j = 1:x
                    temp(j) = -1
                    //Traversing through future pages
                    for k = i+1:n
                        //Page currently in frame available in future pages
                        if(frames(j) == a(k)) then
                            temp(j) = k
                            break
                        end
                    end
                end
                //Traversing through frames
                for j = 1:x
                    //page currently in frame unavailable in future pages
                    if(temp(j) == -1) then
                        pos = j
                        //Set flag3
                        flag3 = 1
                        break
                    end
                end
                //Page currently in frame available in future pages
                if(flag3 ==0) then
                    maximum = temp(1)
                    pos = 1
                    //Traversing through frames
                    for j = 2:x
                        //Find page in frame which is farther in future pages
                        if(temp(j) > maximum) then
                            maximum = temp(j)
                            pos = j
                        end
                    end
                end
                frames(pos) = a(i)
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
