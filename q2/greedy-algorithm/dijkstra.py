INF = 0x3f3f3f3f

class Graph:

    def __init__(self,vertices) -> None:
        self.vertices = vertices
        self.adj_matrix = [[INF for x in range(vertices)] for y in range(vertices)]

    def add_edge(self,v1,v2,weight) -> None: 

        if self.adj_matrix[v2][v1] != INF:

            self.adj_matrix[v1][v2] = 0
            self.adj_matrix[v2][v1] = 0

        else:
            self.adj_matrix[v1][v2] = weight

    def dijkstra(self,origin,destination) -> int:

        spt         = [INF for i in range(self.vertices)]
        spt[origin] = 0

        visited_vertices = set()

        while len(visited_vertices) != self.vertices:   

            min_cost_index  = -1
            min_cost_weight = INF

            for i in range(self.vertices):

                if i not in visited_vertices and min_cost_weight > spt[i]:
                    min_cost_index = i
                    min_cost_weight = spt[min_cost_index]

            if min_cost_weight == INF: 
                break

            visited_vertices.add(min_cost_index)

            for i in range(self.vertices):

                travel_weight = spt[min_cost_index] + self.adj_matrix[min_cost_index][i]

                if spt[i] > travel_weight:
                    spt[i] = travel_weight

        return spt[destination]


while 1:

    graph_input = input().split(' ')

    vertices = int(graph_input[0])
    edges = int(graph_input[1])

    if vertices == 0 and edges == 0:
        break

    g = Graph(vertices)

    for i in range(edges):

        edge_input = input().split(' ')

        v1     = int(edge_input[0])
        v2     = int(edge_input[1])
        weight = int(edge_input[2])

        g.add_edge(v1 - 1,v2 - 1, weight)

    inquiries = int(input())

    for i in range(inquiries):

        travel_input = input().split(' ')

        origin      = int(travel_input[0])
        destination = int(travel_input[1])

        hours_to_traverse = g.dijkstra(origin -1, destination -1)

        if hours_to_traverse < INF:
            print(f'{hours_to_traverse}')
        else: 
            print('Impossible')




