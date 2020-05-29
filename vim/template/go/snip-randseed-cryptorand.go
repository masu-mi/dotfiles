// use crand "crypto/rand" for "math/rand"
seed, _ := crand.Int(crand.Reader, big.NewInt(math.MaxInt64))
rand.Seed(seed.Int64())
