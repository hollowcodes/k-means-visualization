
class Draw {
  
  void draw_dataset(ArrayList<PVector> dataset) {
    for(int i=0; i<=dataset.size() - 1; i++) {
      pushStyle();
      strokeWeight(10);
      stroke(255, 255, 255);
      point(dataset.get(i).x, dataset.get(i).y);
      popStyle();
    }
  }
  
  ArrayList<Integer> get_color(Integer color_id) {
    ArrayList<Integer> color_ = new ArrayList();
    int r = 0;
    int g = 0;
    int b = 0;
    
    switch(color_id) {
      case 0:
        r = 255;
        g = 0;
        b = 0;
        break;
      case 1:
        r = 0;
        g = 255;
        b = 0;
        break;
      case 2:
        r = 0;
        g = 0;
        b = 255;
        break;
      case 3:
        r = 0;
        g = 255;
        b = 255;
        break;
      case 4:
        r = 255;
        g = 255;
        b = 0;
        break;
      case 5:
        r = 255;
        g = 0;
        b = 255;
        break;
    }
    color_.add(r);
    color_.add(g);
    color_.add(b);
    
    return color_;
  }
  
  void draw_point(PVector point, Integer color_id) {
    ArrayList<Integer> color_ = get_color(color_id);
    pushStyle();
    strokeWeight(10);
    stroke(color_.get(0), color_.get(1), color_.get(2));
    point(point.x, point.y);
    
    popStyle();
  }
  
  void draw_cluster(PVector cluster_point, ArrayList<PVector> cluster, Integer color_id) {
    for(int i=0; i<cluster.size(); i++) {
      draw_line(cluster_point, cluster.get(i), color_id);
    }
  }
  
  void draw_line(PVector vec1, PVector vec2, Integer color_id) {
    ArrayList<Integer> color_ = get_color(color_id);
    pushStyle();
    stroke(color_.get(0), color_.get(1), color_.get(2));
    line(vec1.x, vec1.y, vec2.x, vec2.y);
    popStyle();
    
    
  }
}
