"""API Explorer"""

import os
import requests
import pandas as pd
import streamlit as st
from manifoldpy import api
MANIFOLD_API_KEY = os.environ.get("MANIFOLD_API_KEY", "./../")
manifold = api.APIWrapper(MANIFOLD_API_KEY)

with st.echo(code_location='below'):
    total_points = st.slider("Number of points in spiral", 1, 5000, 2000)
    num_turns = st.slider("Number of turns in spiral", 1, 100, 9)

    for market in api.get_markets(2):
        st.json(market.json())
