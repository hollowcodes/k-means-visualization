
ArrayList<PVector> start_points(int K) {

  ArrayList<PVector> k_means = new ArrayList();
  for(int i=0; i<K; i++) {
    double x = 50 + Math.random() * (750 - 50);
    double y = 50 + Math.random() * (750 - 50);
    k_means.add(new PVector((float)x, (float)y));
  }
  
  return k_means;
}
