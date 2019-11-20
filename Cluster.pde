
  
  ArrayList<ArrayList> create_clusters(ArrayList<PVector> cluster_points, ArrayList<PVector> dataset_) {
    // create cluster sets
    ArrayList<PVector> dataset = new ArrayList(dataset_);
    ArrayList<ArrayList> clusters = new ArrayList();
    for(int i=0; i<cluster_points.size(); i++) {
      clusters.add(new ArrayList<PVector>());
    }
    
    /*for(int i=0; i<cluster_points.size(); i++) {
      ArrayList<PVector> current_cluster = new ArrayList();
      clusters.add(current_cluster);
    }*/
    int d_size = dataset_.size();
    for(int d=0; d<d_size/cluster_points.size(); d++) {
      for(int i=0; i<cluster_points.size(); i++) {
        // get current cluster point
        PVector cluster_point = cluster_points.get(i);
        
        // 'nearest' contains x, y, index
        ArrayList<Integer> nearest = get_nearest(cluster_point, dataset);
        
        // calculate nearest point and append to cluster list
        PVector nearest_point = new PVector(nearest.get(0), nearest.get(1));
        
        clusters.get(i).add(nearest_point);
        
        // remove point from dataset
        dataset.remove((int) nearest.get(2));
        //println(nearest.get(2));
        
      }
    }
    //println(clusters.get(0).size());
    /*for(int i=0; i<clusters.get(0).size(); i++) {
      print(clusters.get(0).get(i));
      print("\n________\n");
    }*/
    
    return clusters;
  }
  
  ArrayList<Integer> get_nearest(PVector cluster_point, ArrayList<PVector> dataset) {
    ArrayList<Integer> nearest = new ArrayList();
    
    // get shortest point
    PVector nearest_point = new PVector(0, 0);
    int index = 0;
    double shortest_distance = 800;
    for(int i=0; i<dataset.size(); i++) {
      
      double current_distance = dist(cluster_point.x, cluster_point.y, dataset.get(i).x, dataset.get(i).y);
      if(current_distance < shortest_distance) {
        shortest_distance = current_distance;
        nearest_point = dataset.get(i);
        index = i;
      }
    }
    
    // and its index
    nearest.add(0, (int) nearest_point.x);
    nearest.add(1, (int) nearest_point.y);
    nearest.add(2, index);
    
    return nearest;
  }
  
  PVector update_cluster_point(ArrayList<PVector> cluster) {
    int xs = 0;
    int ys = 0;
    for(int i=0; i<cluster.size(); i++) {
      xs += cluster.get(i).x;
      ys += cluster.get(i).y;
    }
    
    return new PVector((xs/cluster.size()), (ys/cluster.size()));
  }
  
  
  
