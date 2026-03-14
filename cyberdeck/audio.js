// CyberDeck 音效库
const AudioSynth = {
    // 创建音频上下文
    ctx: null,
    
    init() {
        if (!this.ctx) {
            this.ctx = new (window.AudioContext || window.webkitAudioContext)();
        }
    },
    
    // 播放音效
    playTone(frequency, duration, type = 'sine', volume = 0.3) {
        this.init();
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        
        osc.connect(gain);
        gain.connect(this.ctx.destination);
        
        osc.frequency.value = frequency;
        osc.type = type;
        
        gain.gain.setValueAtTime(volume, this.ctx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + duration);
        
        osc.start(this.ctx.currentTime);
        osc.stop(this.ctx.currentTime + duration);
    },
    
    // 成功音效（吃到食物）
    success() {
        this.playTone(880, 0.1, 'sine', 0.3); // A5
        setTimeout(() => this.playTone(1100, 0.15, 'sine', 0.3), 50); // C#6
    },
    
    // 失败音效（撞墙/游戏结束）
    fail() {
        this.playTone(200, 0.3, 'sawtooth', 0.4);
        setTimeout(() => this.playTone(150, 0.4, 'sawtooth', 0.4), 100);
    },
    
    // 点击按钮音效
    click() {
        this.playTone(600, 0.05, 'sine', 0.2);
    },
    
    // 滑动音效（番茄钟）
    slide(speed = 1) {
        const baseFreq = 400;
        const freq = baseFreq + (speed * 100);
        this.playTone(freq, 0.03, 'sine', 0.15);
    },
    
    // 完成音效
    complete() {
        this.playTone(523, 0.1, 'sine', 0.3); // C5
        setTimeout(() => this.playTone(659, 0.1, 'sine', 0.3), 100); // E5
        setTimeout(() => this.playTone(784, 0.2, 'sine', 0.3), 200); // G5
    },
    
    // 警告音效
    warning() {
        this.playTone(800, 0.1, 'square', 0.2);
        setTimeout(() => this.playTone(800, 0.1, 'square', 0.2), 150);
    },
    
    // 翻页音效
    flip() {
        this.playTone(300, 0.05, 'sine', 0.1);
    },
    
    // 打字音效
    type() {
        this.playTone(1200, 0.02, 'sine', 0.05);
    }
};

// 自动初始化
AudioSynth.init();
