-------------------------------------------------------------------------------
--    Copyright 2015 HES-SO HEIG-VD REDS
--    All Rights Reserved Worldwide
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--        http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
-------------------------------------------------------------------------------
--
-- File        : simulation_end_pkg.vhd
-- Description : This package offers the mechanism to listen to objections and
--               the heartbeat in order to detect the simulation end.
--               It offers a component that takes care of it and that will
--               call a procedure just before finishing the simulation.
--               It requires two packages:
--                   - objection_env_pkg
--                       To observe the fact that there is no more objections
--                   - heartbeat_env_pkg
--                       To observe the fact that the simulation seems stuck
--                       somewhere without nothing more happening, even if
--                       objections are still raised.
--
-- Author      : Yann Thoma
-- Team        : REDS institute
-- Date        : 30.10.15
--
--
--| Modifications |------------------------------------------------------------
-- Ver  Date      Who   Description
-- 1.0  30.10.15  YTA   First version
-- 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use std.env.all;

package simulation_pkg is

    -- This procedure generates a clock signal with a certain period and a phase shift
    -- It can be called as a concurrent procedure.
    procedure clock_generator(signal clk : out std_logic;
							signal end_s : in std_logic;
                              constant clk_period : time;
                              constant phi : time := 0 ns);

    -- This procedure generates a simple reset at the beginning of a simulation,
    -- asserting the reset for a certain time.
    -- It can be called as a concurrent procedure.
    procedure simple_startup_reset(signal rst : out std_logic;
                                   constant reset_time : time);

end simulation_pkg;

package body simulation_pkg is

	-- Clock Procedure
    procedure clock_generator(signal clk : out std_logic;
								signal end_s : in std_logic;
                              clk_period : time;
                              phi : time := 0 ns) is
    begin
        clk <= '0';
        wait for phi;
        while (end_s = '0') loop
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
            clk <= '0';
        end loop;
		wait;
    end clock_generator;

	--RESET Procedure
    procedure simple_startup_reset(signal rst : out std_logic;
                                   reset_time : time) is
    begin
        rst <= '1';
        wait for reset_time;
        rst <= '0';
    end simple_startup_reset;

end simulation_pkg;
