# Simulation
This document is used to introduce the detail of the simulation.

## Contents
* [The Introduction of the Simulation Object](#Introduction)
	- [The Structure of the Chemical Reactor Control System](#Introduction.Structure)
	- [The Product of the Chemical Reactor Control System](#Introduction.Product)
	- [The Processes of the Chemical Reactor Control System](#Introduction.Processes)
	- [The Functions of the Chemical Reactor Control System](#Introduction.Functions)
* [Risk Modelling of the Chemical Reactor Control System](#Risk Modelling)
	- [Analysis of Potential Malicious Attacks](#Risk Modelling.Attack Analysis)


<h2 id="Introduction">The Introduction of the Simulation Object</h2>
<h3 id="Introduction.Structure">The Structure of the Chemical Reactor Control System</h3>

The simulation object is a chemical reactor control system which is shown as following figure.

&#8194;&#8194;<img src="/Figures/Structure.of.Reactor.Control.System.png" alt="Structure of Reactor Control System" />

This control network contains three layers:

* Management Layer,
* Control Layer,
* Physical Layer.

In the management layer, there are three personal computers and a web server. All the network devices connect to the Ethernet, which connects the internet via a security gateway.

In the control layer, there are three sub networks: Industrial Ethernet 1, 2, 3. In the sub network "Industrial Ethernet 1", three are a engineer state, a data server, and four PLCs. The sub network "Industrial Ethernet 1" connects the management layer via a security gateway. The remaining two sub networks are same as the sub network "Industrial Ethernet 1", so in this section, their details will not be introduced.

In the physical layer, there are a distillation column and two reactor. In the distillation column, the material is separated into two semi-product. One semi-product is the input of reactor 1, and is fixed in the product with another material. The other semi-product is transported into the reactor 2, and is fixed in the other product.

<h3 id="Introduction.Product">The Product of the Chemical Reactor Control System</h3>
The semi-product and product of this chemical reactor control system is shown as follows.

Symbol | Description
-------| -----------
`s1`| is the semi-product which is the output from the top of the distillation column.
`s2`| is the semi-product which is the other outputs from the bottom of the distillation column.
`s3`| is the product which is the output from the reactor 1.
`s4`| is the product which is the output from the reactor 2.

<h3 id="Introduction.Processes">The Processes of the Chemical Reactor Control System</h3>
The processes of this chemical reactor control system are shown as follows.

* `p1` is the distillation, which can seperate the material into two semi-product `s1` and `s2`.
* `p2` is the mixed heating, which can generate the product by heating semi-product `s1` and the other material.
* `p3` is the heating, which can produce the other product by heating the semi-product `s2`.

So, the process model of this chemical reactor control system is shown as following figure.

&#8194;&#8194;<img src="/Figures/Process.Model.of.Reactor.Control.System.png" width = "250" alt="Process Model of Reactor Control System" />

<h3 id="Introduction.Functions">The Functions of the Chemical Reactor Control System</h3>
The symbols in the physical layer are shown as follows.

* `V1` is the valve of input of distillation column.
* `V2` is the valve of output `s1` of distillation column.
* `V3` is the valve of output `s2` of distillation column.
* `V4` is the valve of input material of reactor 1.
* `V5` is the valve of input `s1` of reactor 1.
* `V6` is the valve of input `s2` of reactor 2.
* `V7` is the valve of output `s3` of reactor 1.
* `V8` is the pressure reducing valve of reactor 1.
* `V9` is the pressure reducing valve of reactor 2.
* `V10` is the valve of output `s4` of reactor 2.
* `S1` is the switch of the heater of the distillation column.
* `S2` is the switch of the heater of the reactor 1.
* `S3` is the switch of the heater of the reactor 2.
* `PS1` is the pressure sensor of the distillation column.
* `PS2` is the pressure sensor of the reactor 1.
* `PS3` is the pressure sensor of the reactor 2.
* `TS1` is the temperature sensor of the distillation column.
* `TS2` is the temperature sensor of the reactor 1.
* `TS3` is the temperature sensor of the reactor 2.
* `LS1` is the level sensor of the reactor 1.
* `LS2` is the level sensor of the reactor 2.
* `B` is the blender of reactor 2.
* `M` is the motor which drives the blender `B`.

The functions of this chemical reactor control system are shown as follows.

* The functions of distillation column:
	- `f1` is the temperature control function of distillation column.
	- `f2` is the pressure control function of distillation column.
	- `f3` is the traffic control function of `V1`.
	- `f4` is the traffic control function of `V2`.
	- `f5` is the traffic control function of `V3`.
	- `f6` is the switch control function of `S1`.
	- `f7` is the temperature sensation function of distillation column.
	- `f8` is the pressure sensation function of distillation column.
* The functions of reactor 1:
	- `f9` is the temperature control function of reactor 1.
	- `f10` is the pressure control function of reactor 1.
	- `f11` is the level control function of reactor 1.
	- `f12` is the traffic control function of `V4`.
	- `f13` is the traffic control function of `V5`.
	- `f14` is the traffic control function of `V7`.
	- `f15` is the pressure reducing function of reactor 1.
	- `f16` is the switch control function of `S2`.
	- `f17` is the temperature sensation function of reactor 1.
	- `f18` is the pressure sensation function of reactor 1.
	- `f19` is the level sensation function of reactor 1.
* The functions of reactor 2:
	- `f20` is the temperature control function of reactor 2.
	- `f21` is the pressure control function of reactor 2.
	- `f22` is the level control function of reactor 2.
	- `f23` is the traffic control function of `V6`.
	- `f24` is the traffic control function of `V10`.
	- `f25` is the pressure reducing function of reactor 2.
	- `f26` is the switch control function of `S3`.
	- `f27` is the temperature sensation function of reactor 2.
	- `f28` is the pressure sensation function of reactor 2.
	- `f29` is the level sensation function of reactor 2.
	- `f30` is the mixing function of reactor 2.

<h2 id="Risk Modelling">Risk Modelling of the Chemical Reactor Control System</h2>
<h3 id="Risk Modelling.Attack Analysis">Analysis of Potential Malicious Attacks</h3>

`1`|23
`123`|fwefwe