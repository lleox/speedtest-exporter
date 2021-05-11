const speedTestNet = require('speedtest-net');

class SpeedTest {

  async run() {
    const result = await speedTestNet({
      acceptLicense: true,
      acceptGdpr: true,
			binary: '/usr/local/bin/speedtest'
    });

    return {
      speeds: {
        download: (result.download.bandwidth  / 125000).toFixed(2),
        upload: (result.upload.bandwidth  / 125000).toFixed(2),
      },
      server: {
        ping: result.ping.latency.toFixed(2),
      }
    };
  }
}

module.exports = SpeedTest;
