defprotocol Geocalc.Point do
  @moduledoc """
    The `Geocalc.Point` protocol is responsible for receiving
    latitude and longitude from any Elixir data structure.
    At this time it have implementations only for Map, Tuple and List.
    Point values can be decimal degrees or DMS (degrees, minutes, seconds).
  """

  @doc "Returns point latitude"
  def latitude(point)

  @doc "Returns point longitude"
  def longitude(point)
end

defimpl Geocalc.Point, for: List do
  def latitude([lat = %Geocalc.DMS{}, _lng]) do
    Geocalc.DMS.to_decimal(lat)
  end

  def latitude([lat, _lng]) when is_number(lat) do
    lat
  end

  def longitude([_lat, lng = %Geocalc.DMS{}]) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude([_lat, lng]) when is_number(lng) do
    lng
  end
end

defimpl Geocalc.Point, for: Map do
  def latitude(%{lat: lat = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lat)
  end

  def latitude(%{lat: lat}) when is_number(lat) do
    lat
  end

  def latitude(%{latitude: lat = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lat)
  end

  def latitude(%{latitude: lat}) when is_number(lat) do
    lat
  end

  def longitude(%{lon: lng = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude(%{lon: lng}) when is_number(lng) do
    lng
  end

  def longitude(%{lng: lng = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude(%{lng: lng}) when is_number(lng) do
    lng
  end

  def longitude(%{longitude: lng = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude(%{longitude: lng}) when is_number(lng) do
    lng
  end
end

defimpl Geocalc.Point, for: Tuple do
  def latitude({lat = %Geocalc.DMS{}, _lng}) do
    Geocalc.DMS.to_decimal(lat)
  end

  def latitude({lat, _lng}) when is_number(lat) do
    lat
  end

  def latitude({:ok, lat = %Geocalc.DMS{}, _lng}) do
    Geocalc.DMS.to_decimal(lat)
  end

  def latitude({:ok, lat, _lng}) when is_number(lat) do
    lat
  end

  def longitude({_lat, lng = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude({_lat, lng}) when is_number(lng) do
    lng
  end

  def longitude({:ok, _lat, lng = %Geocalc.DMS{}}) do
    Geocalc.DMS.to_decimal(lng)
  end

  def longitude({:ok, _lat, lng}) when is_number(lng) do
    lng
  end
end
