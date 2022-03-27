const Count = artifacts.require("Count");

contract("Count", accounts => {
  it("Count increment return 0", () => {
    return Count.deployed()
      .then((instance) => {
        return instance.count.call();
      })
      .then((count) => {
        assert.equal(count.toNumber(), 0);
      });
  });

  it("Count increment return 1", () => {
    return Count.deployed()
      .then((instance) => {
        return instance.increment.call();
      })
      .then((count) => {
        assert.equal(count.toNumber(), 1);
      });
  });
});