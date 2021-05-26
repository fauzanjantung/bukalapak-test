var supertest = require("supertest");
var should = require("should");

var server = supertest.agent("https://jsonplaceholder.typicode.com");

// Test begin
describe("API Automation Test", function () {
  it("should check post data type", function (done) {
    this.timeout(10000);
    // Test Check Post Data Type
    server
      .get("/posts")
      .expect("Content-type", /json/)
      .expect(200) // HTTP response
      .end(function (err, res) {
        // HTTP status should be 200
        res.status.should.equal(200);
        // Check Array of Post
        res.body.should.be.an.instanceOf(Array);
        // Post should be an Object
        res.body[0].should.be.an.instanceOf(Object);
        // Post should have these properties
        res.body[0].should.have.properties("userId", "id", "title", "body");
        // Post userId should be a Number
        res.body[0].userId.should.be.a.number;
        // Post id should be a Number
        res.body[0].id.should.be.a.number;
        // Post title should be a String
        res.body[0].title.should.be.a.string;
        // Post body should be a String
        res.body[0].body.should.be.a.string;

        done();
      });
  });

  it("should compare response with input data", function (done) {
    this.timeout(10000);
    // Test Compare Response With Input Data
    const post = {
      title: "recommendation",
      body: "motorcycle",
      userId: 12,
    };
    server
      .post("/posts")
      .send(post)
      .expect("Content-type", /json/)
      .expect(201) // HTTP response
      .end(function (err, res) {
        // HTTP status should be 201
        res.status.should.equal(201);
        // Post should be an instance of Object
        res.body.should.be.an.instanceOf(Object);
        // Post should have these properties
        res.body.should.have.properties("title", "body", "userId", "id");
        // Response title should equal to input title
        res.body.title.should.equal(post.title);
        // Response body should equal to input body
        res.body.body.should.equal(post.body);
        // Response userId should equal to input userId
        res.body.userId.should.equal(post.userId);
        done();
      });
  });
});
