def number_of_live_cell_around(coord, cellarray)
    ref = []
    cellarray.each do |i|
        ref.push([i[0], i[1]])
    end
    
    x = coord[0]
    y = coord[1]
    
    n1 = 0
    if ref.index([x-1,y-1]) != nil then
        n1 += 1
    end
    if ref.index([x  ,y-1]) != nil then
        n1 += 1
    end
    if ref.index([x+1,y-1]) != nil then
        n1 += 1
    end
    if ref.index([x-1,y  ]) != nil then
        n1 += 1
    end
    if ref.index([x+1,y  ]) != nil then
        n1 += 1
    end
    if ref.index([x-1,y+1]) != nil then
        n1 += 1
    end
    if ref.index([x  ,y+1]) != nil then
        n1 += 1
    end
    if ref.index([x+1,y+1]) != nil then
        n1 += 1
    end
    return n1
end



ary=[[27,19,0],[25,18,0],[27,18,0],[15,17,0],[16,17,0],[23,17,0],[24,17,0],[37,17,0],[38,17,0],[14,16,0],[18,16,0],[23,16,0],[24,16,0],[37,16,0],[38,16,0],[3,15,0],[4,15,0],[13,15,0],[19,15,0],[23,15,0],[24,15,0],[3,14,0],[4,14,0],[13,14,0],[17,14,0],[19,14,0],[20,14,0],[25,14,0],[27,14,0],[13,14,0],[19,13,0],[27,13,0],[13,13,0],[14,12,0],[18,12,0],[15,11,0],[16,11,0]]

# ary = []
# for i in 0..99 do
#     ary.push([rand(10), rand(10), 0])
# end





#p ary.length
ary = ary.uniq

loop {
    neighbor = []
    ary.each do |i|
        if ary.index([i[0]-1,i[1]-1,0]) == nil then
            neighbor.push([i[0]-1,i[1]-1,0])
        end
        if ary.index([i[0]  ,i[1]-1,0]) == nil then
            neighbor.push([i[0]  ,i[1]-1,0])
        end
        if ary.index([i[0]+1,i[1]-1,0]) == nil then
            neighbor.push([i[0]+1,i[1]-1,0])
        end
        if ary.index([i[0]-1,i[1]  ,0]) == nil then
            neighbor.push([i[0]-1,i[1]  ,0])
        end
        if ary.index([i[0]+1,i[1]  ,0]) == nil then
            neighbor.push([i[0]+1,i[1]  ,0])
        end
        if ary.index([i[0]-1,i[1]+1,0]) == nil then
            neighbor.push([i[0]-1,i[1]+1,0])
        end
        if ary.index([i[0]  ,i[1]+1,0]) == nil then
            neighbor.push([i[0]  ,i[1]+1,0])
        end
        if ary.index([i[0]+1,i[1]+1,0]) == nil then
            neighbor.push([i[0]+1,i[1]+1,0])
        end
    end
    
    neighbor = neighbor.uniq
    
    f=open('test.dat','w')
    ary.each do |i|
        f.print i[0],", ",i[1],"\n"
    end
    f.close
    #p ary.length
    
    ary.each do |i|
        i[2] = number_of_live_cell_around(i,ary)
    end
    
    
    neighbor.each do |i|
        i[2] = number_of_live_cell_around(i,ary)
    end
    
    ary.delete_if {|i| i[2] < 2}
    ary.delete_if {|i| i[2] > 3}
    neighbor.delete_if {|i| i[2] != 3}
    
    puts 'after delete'
    
    ary.each do |i|
        print i[0]," ",i[1]," ",i[2],"\n"
    end
    
    puts 'new born'
    neighbor.each do |i|
        print i[0]," ",i[1]," ",i[2],"\n"
    end
    
    ary.concat(neighbor)
    ary.each do |i|
        i[2] = 0
    end
    
    puts 'next cycle'
    
    ary.each do |i|
        print i[0]," ",i[1]," ",i[2],"\n"
    end

    
    sleep(1)
    
    f=open('test.dat','w')
    ary.each do |i|
        f.print i[0],", ",i[1],"\n"
    end
    f.close

}

    
#n.each do |i|
#    print i[0]," ",i[1]," ",i[2], "\n"
#end    

#p number_of_live_cell(ary)

