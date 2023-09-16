"""Author: Christopher Eng, lab05 StoreLocations"""


def read(file_name):
    """reads the file and extracts a list of locations from the file"""
    L = []
    with open(file_name) as file:
        for line in file:
            new_lst = line.split()
            L.append(new_lst[1])
        return L


def best_loc_total(bus_locs: list, median: int):
    """finds the total distance from the best location to the other business locations"""
    total = 0
    for n in bus_locs:
        num = int(n)
        distance = abs(int(median) - (num))
        total += distance
    return total
