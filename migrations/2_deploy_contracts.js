const TodoList = artifacts.require("Color");

module.exports = function(deployer) {
  deployer.deploy(TodoList);
};
