def sorted_enqueue(queue, value):
    curr = queue.front
    if value < curr.value:
        newnode = Node(value, curr)
        queue.front = newnode
        queue.size += 1
    else:
        prev = None
        while curr.value <= value:
            prev = curr
            curr = curr.next
        newnode = Node(value, curr)
        prev.next = newnode


def pull_off_enqueue(queue, value):
    curr = queue.front
    if value < curr.value:
        newnode = Node(value, curr)
        queue.front = newnode
        queue.size += 1
    else:
        prev = None
        while curr.value <= value:
            prev = curr
            curr = curr.next
        newnode = curr
        prev.next = curr.next
        return newnode