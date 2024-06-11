const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const TaskModule = buildModule("taskModule", (m) => {
  const task =  m.contract("Task");
  return { task };
});

module.exports = TaskModule;
