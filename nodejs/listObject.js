var AWS = require('aws-sdk');

var s3 = new AWS.S3({
	'region': 'us-east-1'
});

var params = {
    Bucket: 'clementulrich-second-bucket'
};
s3.listObjects(params, function(err, data) {
    if (err) {
        console.error(err);
    } 
    else {
        console.log('Found in bucket [' + params.Bucket + '] :');

        data.Contents.forEach(element => {
            
            console.log(' - ' + element.Key + ' [' + element.Size + ' bytes]');
        });
    }
});