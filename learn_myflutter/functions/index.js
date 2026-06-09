/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {setGlobalOptions} = require("firebase-functions");
const {onRequest} = require("firebase-functions/https");
const logger = require("firebase-functions/logger");
const {
    onDocumentCreated,
    onDocumentUpdated,
    onDocumentDeleted,
    onDocumentWritten
} = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");
admin.initializeApp();

// For cost control, you can set the maximum number of containers that can be
// running at the same time. This helps mitigate the impact of unexpected
// traffic spikes by instead downgrading performance. This limit is a
// per-function limit. You can override the limit for each function using the
// `maxInstances` option in the function's options, e.g.
// `onRequest({ maxInstances: 5 }, (req, res) => { ... })`.
// NOTE: setGlobalOptions does not apply to functions using the v1 API. V1
// functions should each use functions.runWith({ maxInstances: 10 }) instead.
// In the v1 API, each function can only serve one request per container, so
// this will be the maximum concurrent request count.
setGlobalOptions({ maxInstances: 10 });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started


/* HTTPSトリガー */
 exports.helloWorld = onRequest((request, response) => {
    logger.info("Hello logs!", {structuredData: true});
    response.send("Hello from Firebase!");
 });

exports.showFirestoreDB = onRequest((request, response) => {
    logger.info("showFirestoreDB start", {structuredData: true});
    const db = admin.firestore();
    const docRef = db.collection("tiny_tank").doc("info");
    docRef.get().then((doc) => {
        if (doc.exists) {
            response.send(doc.data());
        } else {
            response.send("No such document!");
        }
    }).catch((error) => {
        response.send("Error getting document");
    });
});


/* Scheduleトリガー */
//exports.timer1 = functions.pubsub.schedule('every 5 minutes').onRun(
//(context) => {
//  logger.info("timer1 start", {structuredData: true});
//  return null;
//});

//exports.timer2 = functions.pubsub.schedule('*/3 * * * *').onRun(
//    (context) => {
//        functions.logger.info("timer2 start", {structuredData: true});
//        return null;
//    }
//);


/* Firestoreトリガー */
exports.createTemporaryOfTinyTankDB = onDocumentCreated('tiny_tank/temporary', (event) => {
    const snapshot = event.data;
    if (!snapshot) return;
    const data = snapshot.data();
    logger.info("DB Create temporary in TinyTank Firestore", {
        structuredData: true,
        data: data,
    });
});

exports.deleteTemporaryOfTinyTankDB = onDocumentDeleted('tiny_tank/temporary', (event) => {
    logger.info("DB Delete temporary in TinyTank Firestore");
});

