import json
from geopy.distance import geodesic
import networkx as nx
from itertools import permutations

# Load the places JSON file
with open('assets/maps/world_people.json') as f:
    data = json.load(f)

places = {place["name"]: (place["latitude"], place["longitude"], place["population"], place["critical_conditions"]) for place in data["places"]}

# Create a weighted graph with critical conditions influencing the route
G = nx.Graph()

# Add edges between places with weights based on critical conditions and distances
for v1 in places:
    for v2 in places:
        if v1 != v2:
            # Calculate actual distance between places using geodesic
            actual_dist = geodesic((places[v1][0], places[v1][1]), (places[v2][0], places[v2][1])).km
            # Calculate critical factor based on the number of critical patients (scaled)
            critical_factor = 1 - (0.1 * places[v2][3])  # Assume critical condition as a factor
            # Weighted distance that accounts for critical conditions
            weighted_dist = actual_dist * critical_factor
            G.add_edge(v1, v2, weight=weighted_dist, actual_distance=actual_dist)

# Solve TSP using brute force (only works for small cases)
def solve_tsp(graph, start):
    nodes = list(graph.nodes)
    nodes.remove(start)  # Remove the start city from the list of cities to permute
    min_path = None
    min_cost = float("inf")

    # Permute all possible routes excluding the start city
    for perm in permutations(nodes):
        path = [start] + list(perm) + [start]
        cost = sum(graph[path[i]][path[i + 1]]['weight'] for i in range(len(path)-1))  # Calculate total weight of the route

        if cost < min_cost:
            min_cost = cost
            min_path = path

    return min_path, min_cost

def find_optimal_route(start_place):
    # Check if the start place is in the data
    if start_place not in places:
        return None, None, None  # Invalid start place

    optimal_route, total_weighted_distance = solve_tsp(G, start_place)

    # Compute actual total distance
    actual_total_distance = sum(G[optimal_route[i]][optimal_route[i + 1]]["actual_distance"]
                                for i in range(len(optimal_route) - 1))

    return optimal_route, total_weighted_distance, actual_total_distance
