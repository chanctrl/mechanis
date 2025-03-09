from flask import Flask, jsonify, request
from algo import find_optimal_route  # Import the function from algo.py

app = Flask(__name__)

@app.route('/get_optimal_route', methods=['GET'])
def get_optimal_route():
    # Get the starting place from the query parameters
    start_place = request.args.get('start')

    if not start_place:
        return jsonify({"error": "Please provide a starting place."}), 400

    # Find the optimal route using the algo
    optimal_route, total_weighted_distance, actual_total_distance = find_optimal_route(start_place)

    if not optimal_route:
        return jsonify({"error": "Invalid starting place or no valid route found."}), 400

    # Return the result as JSON
    return jsonify({
        "optimal_route": optimal_route,
        "total_weighted_distance": total_weighted_distance,
        "actual_total_distance": actual_total_distance
    })

if __name__ == '__main__':
    app.run(debug=True)
    