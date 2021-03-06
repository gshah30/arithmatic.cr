require "./spec_helper"

describe PrimesRepo do
  describe ".get_closest_primes" do
    Hash(Int32, Tuple(Int32, Int32)){
      121 => {113, 127},
      10_74_834 => {10_74_833, 10_74_839},
      27_50_140 => {27_50_131, 27_50_159}
    }
    .each do |k, v|
      it "returns the closest primes for the non-prime #{k}" do
        PrimesRepo.get_closest_primes(k).as(Tuple(Int32, Int32, Int32)).tap do |closest_primes|
          closest_primes[0].should eq v[0]
          closest_primes[1].should eq v[1]
        end
      end
    end
  end

  describe ".get_nth_prime" do
    Hash(Int32, Int32){
      99_999 => 12_99_689,
      3_00_000 => 42_56_233
    }
    .each do |k, v|
      it "returns #{k}th prime number" do
        PrimesRepo.get_nth_prime(k).should eq v
      end
    end
  end

  describe ".get_primes_in_index_range" do
    it "gets primes in the index range 99991 to 100020" do
      PrimesRepo.get_primes_in_index_range(99991, 100020).should eq [
        1299553, 1299583, 1299601, 1299631, 1299637, 1299647,
        1299653, 1299673, 1299689, 1299709, 1299721, 1299743,
        1299763, 1299791, 1299811, 1299817, 1299821, 1299827,
        1299833, 1299841, 1299853, 1299869, 1299877, 1299887,
        1299899, 1299917, 1299919, 1299941, 1299953, 1299979,       ]
    end

    it "gets primes in the index range 899 to 998" do
      PrimesRepo.get_primes_in_index_range(899, 998).should eq [
        6991, 6997, 7001, 7013, 7019, 7027, 7039, 7043, 7057, 7069,
        7079, 7103, 7109, 7121, 7127, 7129, 7151, 7159, 7177, 7187,
        7193, 7207, 7211, 7213, 7219, 7229, 7237, 7243, 7247, 7253,
        7283, 7297, 7307, 7309, 7321, 7331, 7333, 7349, 7351, 7369,
        7393, 7411, 7417, 7433, 7451, 7457, 7459, 7477, 7481, 7487,
        7489, 7499, 7507, 7517, 7523, 7529, 7537, 7541, 7547, 7549,
        7559, 7561, 7573, 7577, 7583, 7589, 7591, 7603, 7607, 7621,
        7639, 7643, 7649, 7669, 7673, 7681, 7687, 7691, 7699, 7703,
        7717, 7723, 7727, 7741, 7753, 7757, 7759, 7789, 7793, 7817,
        7823, 7829, 7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901
      ]
    end
  end

  describe ".get_primes_in_range" do
    it "gets primes in the range 1301099 to 1301471" do
      PrimesRepo.get_primes_in_range(1301099, 1301471).should eq [
        1301099, 1301119, 1301123, 1301147, 1301149, 1301171,
        1301173, 1301219, 1301221, 1301233, 1301239, 1301243,
        1301249, 1301257, 1301273, 1301281, 1301297, 1301323,
        1301347, 1301353, 1301387, 1301389, 1301393, 1301413,
        1301423, 1301437, 1301453, 1301459, 1301467, 1301471
      ]
    end

    it "gets primes in the range 1301099 to 1301471" do
      PrimesRepo.get_primes_in_range(6988, 7905).should eq [
        6991, 6997, 7001, 7013, 7019, 7027, 7039, 7043, 7057, 7069,
        7079, 7103, 7109, 7121, 7127, 7129, 7151, 7159, 7177, 7187,
        7193, 7207, 7211, 7213, 7219, 7229, 7237, 7243, 7247, 7253,
        7283, 7297, 7307, 7309, 7321, 7331, 7333, 7349, 7351, 7369,
        7393, 7411, 7417, 7433, 7451, 7457, 7459, 7477, 7481, 7487,
        7489, 7499, 7507, 7517, 7523, 7529, 7537, 7541, 7547, 7549,
        7559, 7561, 7573, 7577, 7583, 7589, 7591, 7603, 7607, 7621,
        7639, 7643, 7649, 7669, 7673, 7681, 7687, 7691, 7699, 7703,
        7717, 7723, 7727, 7741, 7753, 7757, 7759, 7789, 7793, 7817,
        7823, 7829, 7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901
      ]
    end
  end

  describe ".prime?" do
    context "when number to check is less than cache size" do
      it "checks if a number is prime" do
        PrimesRepo.prime?(48611).should be_true
        PrimesRepo.prime?(48612).should be_false
      end
    end

    context "when number to check is more than cache size" do
      it "checks if a number is prime" do
        PrimesRepo.prime?(104827).should be_true
        PrimesRepo.prime?(104823).should be_false
      end
    end

    context "when number to check is negative" do
      it "considers negative numbers as not primes" do
        PrimesRepo.prime?(-104827).should be_false
      end
    end
  end

  # TODO: write missing method specs
end