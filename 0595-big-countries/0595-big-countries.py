import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    big_cntry = world[(world['area']>=3000000 ) | (world['population']>=25000000)]
    result_world = big_cntry[['name','population','area']]
    return result_world
    