
class Dataset {

  int dataset_size;

  Dataset(int dataset_size) {
    this.dataset_size = dataset_size;
  }
  
  ArrayList<PVector> create_batch(int min_x, int max_x, int min_y, int max_y) {
    
    ArrayList<PVector> set = new ArrayList<PVector>();
    for(int i=1; i<=dataset_size/3; i++) {
      double x = min_x + Math.random() * (max_x - min_x);
      double y = min_y + Math.random() * (max_y - min_y);
            
      PVector element = new PVector( (float)x, (float)y);
      set.add(element); 
    }
    return set;
  }
  
  ArrayList<PVector> create_dataset() {
    
    ArrayList<PVector> dataset = new ArrayList();
    
    dataset.addAll(create_batch(20, 350, 20, 325));
    dataset.addAll(create_batch(425, 780, 20, 325));
    dataset.addAll(create_batch(150, 650, 425, 780));

    return dataset;
  }
}
