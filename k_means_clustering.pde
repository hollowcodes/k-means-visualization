
Dataset dataset = new Dataset(100);
Draw draw = new Draw();

int K = 3;

ArrayList<PVector> cluster_points = start_points(K);
ArrayList<PVector> data_set = dataset.create_dataset();


void setup() {
  //println("size is " + data_set.size());

  background(0);
  size(800, 800);
  frameRate(2);
}

void draw() {
  background(0);
  // draw dataset points
  draw.draw_dataset(data_set);
  
  // draw cluster points
  for(int i=0; i<K; i++) {
    draw.draw_point(cluster_points.get(i), i);
  }
  // create clusters
  ArrayList<ArrayList> clusters = create_clusters(cluster_points, data_set);
  //println("P " + clusters.get(0).size());
  for(int i=0; i<K; i++) {
    draw.draw_cluster(cluster_points.get(i), clusters.get(i), i);
  }
  
  for(int i=0; i<cluster_points.size(); i++) {
    //println(i + " : " + clusters.get(i).size());
    cluster_points.set(i, update_cluster_point(clusters.get(i)));
  }
  // TODO get average of the points and update cluster_points

  
}
