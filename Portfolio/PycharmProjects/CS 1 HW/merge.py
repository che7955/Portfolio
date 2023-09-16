def merge_sort(L):
    """
    mergeSort: List( A ) -> List( A )
       where A is totally ordered
    """
    if L == []:
        return []
    elif len(L) == 1:
        return L
    else:
        ( half1, half2 ) = split(L)#splits in half
        return merge(merge_sort(half1), merge_sort(half2))#recursivly calls merge sort and encapsulates as merge

def split(data):
    #splits into 2 lists
    return data[::2], data[1::2]
left, right = split(data)

def merge(left, right):
    result = []
    left_index, right_index = 0, 0
    #finds left and right indexes
    while left_index < len(left) and right_index < len(right):
        #orders the 2 lists sepreatly
        if left[left_index] <= right[right_index]:
            result.append(left[left_index])
            left_index += 1
        else:
            result.append(right[right_index])
            right_index += 1
    if left_index < len(left):
        result.extend(left[left_index:])
    elif right_index < len(right):
        result.extend(right[right_index:])
    return result
result = merge(left, right)