var (
	mx     sync.Mutex
	logger *log.Logger
)

func SetLogger(l *log.Logger) {
	mx.Lock()
	defer mx.Unlock()
	logger = l
}

func logf(format string, v ...interface{}) {
	if logger == nil {
		return
	}
	logger.Printf(format, v...)
}
