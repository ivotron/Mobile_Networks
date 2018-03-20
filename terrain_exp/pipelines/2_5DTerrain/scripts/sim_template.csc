<?xml version="1.0" encoding="UTF-8"?>
<simconf>
  <project EXPORT="discard">[APPS_DIR]/mrm</project>
  <project EXPORT="discard">[APPS_DIR]/mspsim</project>
  <project EXPORT="discard">[APPS_DIR]/avrora</project>
  <project EXPORT="discard">[APPS_DIR]/serial_socket</project>
  <project EXPORT="discard">[APPS_DIR]/collect-view</project>
  <project EXPORT="discard">[APPS_DIR]/powertracker</project>
  <simulation>
    <title>My simulation</title>
    <randomseed>{{ RANDOM_SEED }}</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      org.contikios.cooja.radiomediums.TerrainLOSMedium
      <transmitting_range>50.0</transmitting_range>
      <interference_range>100.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>1.0</success_ratio_rx>
      <terrain_filepath>./java/org/contikios/cooja/radiomediums/terrain/N37W123.hgt</terrain_filepath>
      <east_width>240</east_width>
      <south_width>180</south_width>
      <east_offset>2880</east_offset>
      <south_offset>3060</south_offset>
      <output_dag>false</output_dag>
    </radiomedium>
    <events>
      <logoutput>40000</logoutput>
    </events>
    <motetype>
      org.contikios.cooja.motes.ImportAppMoteType
      <identifier>apptype1</identifier>
      <description>Application Mote Type #apptype1</description>
      <motepath>[COOJA_DIR]/examples/appmote_mobile</motepath>
      <moteclass>AppMoteMobile</moteclass>
    </motetype>
    {% for x_val,y_val in COORD %}
    <mote>
      <interface_config>
        org.contikios.cooja.motes.AbstractApplicationMoteType$SimpleMoteID
        <id>{{ loop.index }}</id>
      </interface_config>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>{{ x_val }}</x>
        <y>{{ y_val }}</y>
        <z>0.0</z>
      </interface_config>
      <motetype_identifier>apptype1</motetype_identifier>
    </mote>
    {% endfor %}
  </simulation>
  <plugin>
    org.contikios.cooja.plugins.SimControl
    <width>280</width>
    <z>5</z>
    <height>160</height>
    <location_x>400</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.Visualizer
    <plugin_config>
      <moterelations>true</moterelations>
      <skin>org.contikios.cooja.plugins.skins.IDVisualizerSkin</skin>
      <skin>org.contikios.cooja.plugins.skins.GridVisualizerSkin</skin>
      <skin>org.contikios.cooja.plugins.skins.TrafficVisualizerSkin</skin>
      <skin>org.contikios.cooja.plugins.skins.TerrainLOSVisualizerSkin</skin>
      <viewport>0.9090909090909091 0.0 0.0 0.9090909090909091 -4433.300972649341 -4303.503746042732</viewport>
    </plugin_config>
    <width>400</width>
    <z>4</z>
    <height>400</height>
    <location_x>1</location_x>
    <location_y>1</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.LogListener
    <plugin_config>
      <filter />
      <formatted_time />
      <coloring />
    </plugin_config>
    <width>100</width>
    <z>3</z>
    <height>240</height>
    <location_x>400</location_x>
    <location_y>160</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.TimeLine
    <plugin_config>
      {% set max = MOTES %}
      {% for i in range(max) %}
      	<mote>{{ i }}</mote>
      {% endfor %}
      <showRadioRXTX />
      <showRadioHW />
      <showLEDs />
      <zoomfactor>500.0</zoomfactor>
    </plugin_config>
    <width>500</width>
    <z>2</z>
    <height>166</height>
    <location_x>0</location_x>
    <location_y>481</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.Notes
    <plugin_config>
      <notes>Enter notes here</notes>
      <decorations>true</decorations>
    </plugin_config>
    <width>150</width>
    <z>1</z>
    <height>300</height>
    <location_x>680</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.ScriptRunner
    <plugin_config>
      <script>/*&#xD;
 * Example Contiki test script (JavaScript).&#xD;
 * A Contiki test script acts on mote output, such as via printf()'s.&#xD;
 * The script may operate on the following variables:&#xD;
 *  Mote mote, int id, String msg&#xD;
 */&#xD;
&#xD;
TIMEOUT(200000, log.log("last message: " + msg + "\n"));&#xD;
&#xD;
WAIT_UNTIL(msg.startsWith('final cvis'));&#xD;
log.log("*last message: " + msg + "\n");&#xD;
log.testOK();&#xD;
SCRIPT_KILL();</script>
      <active>false</active>
    </plugin_config>
    <width>1042</width>
    <z>0</z>
    <height>632</height>
    <location_x>535</location_x>
    <location_y>221</location_y>
  </plugin>
</simconf>

